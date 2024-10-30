import sys
from PyQt5.QtWidgets import QApplication, QMainWindow, QFileDialog, QLabel, QPushButton, QVBoxLayout, QWidget
from PyQt5.QtGui import QPixmap, QImage
from PyQt5.QtCore import QThread, pyqtSignal
import serial
import cv2
import numpy as np

class ImageProcessingThread(QThread):
    progress = pyqtSignal(np.ndarray)  # Señal para emitir el progreso de la imagen procesada

    def __init__(self, input_image, ser):
        super().__init__()
        self.input_image = input_image
        self.ser = ser

    def run(self):
        height, width = self.input_image.shape
        output_image = np.zeros_like(self.input_image)
        try:
            for y in range(1, height - 1):
                for x in range(1, width - 1):
                    block = self.input_image[y-1:y+2, x-1:x+2]
                    print(f"Procesando bloque en ({y}, {x}):\n{block}")
                    processed_pixel = self.send_and_receive_block(block)
                    if processed_pixel is not None:
                        output_image[y, x] = processed_pixel
                self.progress.emit(output_image)  # Emitir la imagen procesada parcialmente
        except Exception as e:
            print(f"Error durante el procesamiento de la imagen: {e}")

    def send_and_receive_block(self, block):
        height, width = block.shape
        try:
            for y in range(height):
                for x in range(width):
                    pixel_value = int(block[y, x])  # Convertir a entero de Python
                    self.ser.write(pixel_value.to_bytes(1, byteorder='big'))
                    print(f"Enviado pixel [{y}, {x}]: {pixel_value}")

            processed_pixel_data = self.ser.read(1)
            if len(processed_pixel_data) < 1:
                print("Error: No se pudo leer el dato del píxel procesado")
                return None
            processed_pixel = int.from_bytes(processed_pixel_data, byteorder='big')
            print(f"Recibido pixel procesado: {processed_pixel}")
            return processed_pixel
        except serial.SerialException as e:
            print(f"Error de comunicación serial: {e}")
            return None

class ImageProcessingApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.initUI()
        try:
            self.ser = serial.Serial('COM4', 9600, timeout=1)  # Configurar puerto serial con timeout
            self.ser.flush()
        except serial.SerialException as e:
            print(f"Error al abrir el puerto serial: {e}")
            sys.exit(1)

    def initUI(self):
        self.setWindowTitle('Procesamiento de Imágenes')
        self.setGeometry(100, 100, 800, 600)

        # Crear widgets
        self.input_label = QLabel()
        self.output_label = QLabel()
        open_button = QPushButton('Abrir Imagen')
        process_button = QPushButton('Procesar Imagen')

        # Conectar señales
        open_button.clicked.connect(self.open_image)
        process_button.clicked.connect(self.process_image)

        # Crear layout
        layout = QVBoxLayout()
        layout.addWidget(self.input_label)
        layout.addWidget(open_button)
        layout.addWidget(process_button)
        layout.addWidget(self.output_label)

        # Crear widget central
        central_widget = QWidget()
        central_widget.setLayout(layout)
        self.setCentralWidget(central_widget)

    def open_image(self):
        file_path, _ = QFileDialog.getOpenFileName(self, 'Abrir Imagen', '', 'Imágenes (*.png *.jpg *.bmp)')
        if file_path:
            self.input_image = cv2.imread(file_path, cv2.IMREAD_GRAYSCALE)
            self.display_image(self.input_image, self.input_label)
            self.output_image = np.zeros_like(self.input_image)

    def process_image(self):
        if hasattr(self, 'input_image'):
            self.thread = ImageProcessingThread(self.input_image, self.ser)
            self.thread.progress.connect(self.update_output_image)
            self.thread.start()

    def update_output_image(self, output_image):
        self.output_image = output_image
        self.display_image(self.output_image, self.output_label)

    def display_image(self, image, label):
        qimg = qimg_from_cvimg(image)
        pixmap = QPixmap.fromImage(qimg)
        label.setPixmap(pixmap)

def qimg_from_cvimg(cv_img):
    height, width = cv_img.shape
    bytesPerLine = width
    qimg = QImage(cv_img.data, width, height, bytesPerLine, QImage.Format_Grayscale8)
    return qimg

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = ImageProcessingApp()
    window.show()
    sys.exit(app.exec_())
