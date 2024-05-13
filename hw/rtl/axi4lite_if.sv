interface axi4lite_if #(parameter A_WIDTH = 32, D_WIDTH = 32)(); 
  bit                          aclk;
  logic [A_WIDTH-1:0]          awaddr;
  logic [2:0]                  awprot;
  logic                        awvalid;
  logic                        awready;
  logic [D_WIDTH-1:0]          wdata;
  logic [D_WIDTH/8-1:0]        wstrb;
  logic                        wvalid;
  logic                        wready;
  logic [1:0]                  bresp;
  logic                        bvalid;
  logic                        bready;
  logic [A_WIDTH-1:0]          araddr;
  logic [2:0]                  arprot;
  logic                        arvalid;
  logic                        arready;
  logic [D_WIDTH-1:0]          rdata;
  logic [1:0]                  rresp;
  logic                        rvalid;
  logic                        rready;

modport master (
  output awaddr, awprot, awvalid, wdata, wstrb, wvalid, bready, araddr, arprot, arvalid, rready,
  input  awready, wready, bresp, bvalid, arready, rdata, rresp, rvalid     
);

modport slave (
  input   awaddr, awprot, awvalid, wdata, wstrb, wvalid, bready, araddr, arprot, arvalid, rready,
  output  awready, wready, bresp, bvalid, arready, rdata, rresp, rvalid     
);

    
clocking m_cb @(posedge aclk);
  output awaddr, awprot, awvalid, wdata, wstrb, wvalid, bready, araddr, arprot, arvalid, rready;
  input  awready, wready, bresp, bvalid, arready, rdata, rresp, rvalid;     
endclocking;

clocking s_cb @(posedge aclk);
  input awaddr, awprot, awvalid, wdata, wstrb, wvalid, bready, araddr, arprot, arvalid, rready;
  output  awready, wready, bresp, bvalid, arready, rdata, rresp, rvalid;     
endclocking;

modport tb_master(clocking m_cb);

modport tb_slave(clocking s_cb);
                

endinterface
