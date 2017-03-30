library verilog;
use verilog.vl_types.all;
entity final_project_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        enable          : in     vl_logic;
        wren            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end final_project_vlg_sample_tst;
