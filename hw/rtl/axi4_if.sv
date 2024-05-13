interface axi4_if #(parameter A_WIDTH = 32, D_WIDTH = 32, ID_WIDTH = 4, USER_WIDTH=4)();
  logic   [ ID_WIDTH-1:0]       awid;
  logic   [  A_WIDTH-1:0]       awaddr;
  logic   [ 7:0]                awlen;
  logic   [ 2:0]                awsize;
  logic   [ 1:0]                awburst;
  logic                         awlock;
  logic   [ 3:0]                awcache;
  logic   [ 2:0]                awprot;
  logic   [ 3:0]                awregion;
  logic   [ USER_WIDTH-1:0]     awuser;
  logic   [ 3:0]                awqos;
  logic                         awvalid;
  logic                         awready;
  logic   [    D_WIDTH-1:0]     wdata;
  logic   [(D_WIDTH/8)-1:0]     wstrb;
  logic                         wlast;
  logic   [ USER_WIDTH-1:0]     wuser;
  logic                         wvalid;
  logic                         wready;
  logic   [ ID_WIDTH-1:0]       bid;
  logic   [ 1:0]                bresp;
  logic                         bvalid;
  logic                         bready;
  logic   [ USER_WIDTH-1:0]     buser;
  logic   [ ID_WIDTH-1:0]       arid;
  logic   [ A_WIDTH-1:0]        araddr;
  logic   [ 7:0]                arlen;
  logic   [ 2:0]                arsize;
  logic   [ 1:0]                arburst;
  logic                         arlock;
  logic   [ 3:0]                arcache;
  logic   [ 2:0]                arprot;
  logic   [ 3:0]                arregion;
  logic   [ USER_WIDTH-1:0]     aruser;
  logic   [ 3:0]                arqos;
  logic                         arvalid;
  logic                         arready;
  logic   [ ID_WIDTH-1:0]       rid;
  logic   [ D_WIDTH-1:0]        rdata;
  logic   [ 1:0]                rresp;
  logic                         rlast;
  logic                         rvalid;
  logic                         rready;
  logic   [ USER_WIDTH-1:0]     ruser;

modport master (
    input arready, rid, rdata, rresp, rlast, rvalid, wready, bid, bresp, bvalid, awready, ruser, buser,
    output awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awregion, awuser, awqos, awvalid, wdata, wstrb, wlast, wuser, wvalid, bready, arid, araddr, arlen,
    arsize, arburst, arlock, arcache, arprot, arregion, aruser, arqos, arvalid, rready
);

modport slave (
    output arready, rid, rdata, rresp, rlast, rvalid, wready, bid, bresp, bvalid, awready, ruser, buser,
    input  awid, awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awregion, awuser, awqos, awvalid, wdata, wstrb, wlast, wuser, wvalid, bready, arid, araddr, arlen,
    arsize, arburst, arlock, arcache, arprot, arregion, aruser, arqos, arvalid, rready
);

endinterface
