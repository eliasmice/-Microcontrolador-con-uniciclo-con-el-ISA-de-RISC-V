import sys
from PyQt5.QtWidgets import QApplication, QMainWindow, QFileDialog, QLabel, QPushButton, QVBoxLayout, QWidget
from PyQt5.QtGui import QPixmap, QImage
import serial
import cv2
import numpy as np

class ImageProcessingApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.initUI()
        self.ser = serial.Serial('COM4', 115200, timeout=1)  # Configurar puerto serial con timeout
        self.ser.flush()

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

    def process_image(self):
        if hasattr(self, 'input_image'):
            # Enviar datos de la imagen al microcontrolador
            self.send_image_data(self.input_image)

            # Recibir datos de la imagen procesada
            processed_data = self.receive_image_data()

            if processed_data is not None:
                # Reconstruir la imagen procesada
                processed_image = self.reconstruct_image(processed_data, self.input_image.shape)

                # Mostrar la imagen procesada
                self.display_image(processed_image, self.output_label)

    def send_image_data(self, image):
        # Obtener las dimensiones de la imagen
        height, width = image.shape

        # Iterar sobre cada píxel de la imagen
        for y in range(height):
            for x in range(width):
                # Obtener el valor de intensidad del píxel
                intensity = image[y, x]

                # Imprimir el valor de intensidad del píxel
                print(f"Pixel ({x}, {y}): Intensidad={intensity}")

        # Convertir la imagen a bytes
        image_bytes = image.tobytes()

        # Enviar los datos al puerto serial
        self.ser.write(image_bytes)

    def receive_image_data(self):
        # Leer el tamaño de la imagen procesada
        size_bytes = self.ser.read(4)
        if len(size_bytes) < 4:
            print("Error: No se pudo leer el tamaño de la imagen procesada")
            return None

        size = int.from_bytes(size_bytes, byteorder='big')

        # Leer los datos de la imagen procesada
        processed_data = self.ser.read(size)
        if len(processed_data) < size:
            print("Error: No se pudieron leer todos los datos de la imagen procesada")
            return None

        return processed_data

    def reconstruct_image(self, data, shape):
        # Reconstruir la imagen a partir de los datos recibidos
        nparr = np.frombuffer(data, np.uint8)
        image = cv2.imdecode(nparr, cv2.IMREAD_GRAYSCALE)
        return image

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
