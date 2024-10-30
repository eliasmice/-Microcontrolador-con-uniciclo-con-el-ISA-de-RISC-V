        repeat (30) @(posedge clk);

        
        // El procesador quiere iniciar la cuenta 
        activation = 2'b01;
        we_7seg = 1;
        repeat (1) @(posedge clk);


        // Está realizando la cuenta 
        we_7seg = 0;
        repeat (75) @(posedge clk);


        // El procesador ordena que se termine la cuenta
        activation = 2'b10;
        we_7seg = 1;
        repeat (1) @(posedge clk);

        // Debería mostrarse el valor contado en los displays
        we_7seg = 0;
        repeat (10) @(posedge clk);



        // Finish simulation
        $finish;
    end

    

endmodule