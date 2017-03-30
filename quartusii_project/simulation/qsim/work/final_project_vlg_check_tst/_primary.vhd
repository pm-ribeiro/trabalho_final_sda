library verilog;
use verilog.vl_types.all;
entity final_project_vlg_check_tst is
    port(
        addresstest     : in     vl_logic_vector(10 downto 0);
        q               : in     vl_logic_vector(7 downto 0);
        q2_test         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end final_project_vlg_check_tst;
