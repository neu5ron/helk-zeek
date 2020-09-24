event zeek_init (){
  local dce_rpc_ports = { 445/tcp };
  Analyzer::register_for_ports(Analyzer::ANALYZER_DCE_RPC, dce_rpc_ports);
}
