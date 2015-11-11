library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g53_PrimeCounter is
  port (
    CLK, TC_EN: in std_logic;
    mode: std_logic_vector(1 downto 0) ;
    cnt: out std_logic_vector(7 downto 0)
  ) ;
end entity ; -- g53_PrimeCounter

architecture arch of g53_PrimeCounter is
    type PrimeState is (s2, s3, s5, s7, s11, s13, s17, s19, s23, s29, s31, s37, 
        s41, s43, s47, s53, s59, s61, s67, s71, s73, s79, s83, s89, s97);
    signal y : PrimeState;

begin

fms : process( mode, CLK, TC_EN )
begin

    if rising_edge(CLK) then
        if not(TC_EN = '1') then
            -- do nothing return same state
        else
            case y  is
                when s2 => y <= s3;
        
                when s3 =>
                    if mode = "00" then
                        y <= s5;
                    elsif mode = "01" then
                        y <= s5;
                    elsif mode = "10" then
                        y <= s7;
                    end if ;

                when s5 =>
                    if mode = "00" then
                        y <= s7;
                    elsif mode = "01" then
                        y <= s11;
                    elsif mode = "10" then
                        y <= s7;
                    end if ;

                when s7 =>
                    if mode = "00" then
                        y <= s11;
                    elsif mode = "01" then
                        y <= s11;
                    elsif mode = "10" then
                        y <= s31;
                    end if ;

                when s11 =>
                    if mode = "00" then
                        y <= s13;
                    elsif mode = "01" then
                        y <= s23;
                    elsif mode = "10" then
                        y <= s31;
                    end if ;

                when s13 =>
                    if mode = "00" then
                        y <= s17;
                    elsif mode = "01" then
                        y <= s23;
                    elsif mode = "10" then
                        y <= s31;
                    end if ;

                when s17 =>
                    if mode = "00" then
                        y <= s19;
                    elsif mode = "01" then
                        y <= s23;
                    elsif mode = "10" then
                        y <= s31;
                    end if ;

                when s19 =>
                    if mode = "00" then
                        y <= s23;
                    elsif mode = "01" then
                        y <= s23;
                    elsif mode = "10" then
                        y <= s31;
                    end if ;

                when s23 =>
                    if mode = "00" then
                        y <= s29;
                    elsif mode = "01" then
                        y <= s29;
                    elsif mode = "10" then
                        y <= s31;
                    end if ;

                when s29 =>
                    if mode = "00" then
                        y <= s31;
                    elsif mode = "01" then
                        y <= s41;
                    elsif mode = "10" then
                        y <= s31;
                    end if;
    
                when s31 =>
                    if mode = "00" then
                        y <= s37;                        
                    elsif mode = "01" then
                        y <= s41;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s37 =>
                    if mode = "00" then
                        y <= s41;
                    elsif mode = "01" then
                        y <= s41;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s41 =>
                    if mode = "00" then
                        y <= s43;
                    elsif mode = "01" then
                        y <= s53;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s43 =>
                    if mode = "00" then
                        y <= s47;
                    elsif mode = "01" then
                        y <= s53;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s47 =>
                    if mode = "00" then
                        y <= s53;
                    elsif mode = "01" then
                        y <= s53;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s53 =>
                    if mode = "00" then
                        y <= s59;
                    elsif mode = "01" then
                        y <= s83;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s59 =>
                    if mode = "00" then
                        y <= s61;
                    elsif mode = "01" then
                        y <= s83;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s61 =>
                    if mode = "00" then
                        y <= s67;
                    elsif mode = "01" then
                        y <= s83;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s67 =>
                    if mode = "00" then
                        y <= s71;
                    elsif mode = "01" then
                        y <= s83;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s71 =>
                    if mode = "00" then
                        y <= s73;
                    elsif mode = "01" then
                        y <= s83;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s73 =>
                    if mode = "00" then
                        y <= s79;
                    elsif mode = "01" then
                        y <= s83;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s79 =>
                    if mode = "00" then
                        y <= s83;
                    elsif mode = "01" then
                        y <= s83;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s83 =>
                    if mode = "00" then
                        y <= s89;
                    elsif mode = "01" then
                        y <= s89;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s89 =>
                    if mode = "00" then
                        y <= s97;
                    elsif mode = "01" then
                        y <= s2;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;

                when s97 =>
                    if mode = "00" then
                        y <= s2;
                    elsif mode = "01" then
                        y <= s2;
                    elsif mode = "10" then
                        y <= s3;
                    end if ;
                
                when others => y <= s3;
            end case ;

        end if ; -- enable
    end if ; -- clock rising edge
        
end process ; -- fms

state_decode : process( y )
begin
    case( y ) is
        when s2 => 
            cnt <= std_logic_vector(to_unsigned(2,8)) ;
        when s3 => 
            cnt <= std_logic_vector(to_unsigned(3,8)) ;
        when s5 => 
            cnt <= std_logic_vector(to_unsigned(5,8)) ;
        when s7 => 
            cnt <= std_logic_vector(to_unsigned(7,8)) ;
        when s11 => 
            cnt <= std_logic_vector(to_unsigned(11,8)) ;
        when s13 => 
            cnt <= std_logic_vector(to_unsigned(13,8)) ;
        when s17 => 
            cnt <= std_logic_vector(to_unsigned(17,8)) ;
        when s19 => 
            cnt <= std_logic_vector(to_unsigned(19,8)) ;
        when s23 => 
            cnt <= std_logic_vector(to_unsigned(23,8)) ;
        when s29 => 
            cnt <= std_logic_vector(to_unsigned(29,8)) ;
        when s31 => 
            cnt <= std_logic_vector(to_unsigned(31,8)) ;
        when s37 => 
            cnt <= std_logic_vector(to_unsigned(37,8)) ;
        when s41 => 
            cnt <= std_logic_vector(to_unsigned(41,8)) ;
        when s43 => 
            cnt <= std_logic_vector(to_unsigned(43,8)) ;
        when s47 => 
            cnt <= std_logic_vector(to_unsigned(47,8)) ;
        when s53 => 
            cnt <= std_logic_vector(to_unsigned(53,8)) ;
        when s59 => 
            cnt <= std_logic_vector(to_unsigned(59,8)) ;
        when s61 => 
            cnt <= std_logic_vector(to_unsigned(61,8)) ;
        when s67 => 
            cnt <= std_logic_vector(to_unsigned(67,8)) ;
        when s71 => 
            cnt <= std_logic_vector(to_unsigned(71,8)) ;
        when s73 => 
            cnt <= std_logic_vector(to_unsigned(73,8)) ;
        when s79 => 
            cnt <= std_logic_vector(to_unsigned(79,8)) ;
        when s83 => 
            cnt <= std_logic_vector(to_unsigned(83,8)) ;
        when s89 => 
            cnt <= std_logic_vector(to_unsigned(89,8)) ;
        when s97 => 
            cnt <= std_logic_vector(to_unsigned(97,8)) ;
    end case ;
end process ; -- state_decode

end architecture ; -- arch

