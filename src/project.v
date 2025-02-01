/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    
  // All output pins must be assigned. If not used, assign to 0.

  // List all unused inputs to prevent warnings
    wire _unused = &{ena, ui_in[7:3], 1'b0};

    Toplevel uut (.clk(clk),.Bus_Out(uio_out),.Bus_In(uio_in),.rst(~rst_n),.En(uo_out[0]), .Rw(uo_out[1]), .pause(ui_in[0]), .regSelect(ui_in[2:1]), .dispReg(uo_out[7:3]) ,.ALE(uo_out[2]), .TT_En(uio_oe));
endmodule
