-- Filler data for now, separate hard drive to run when the virtual machine is launched

process
begin
  CLK <= '1'; wait for 10 NS;
  CLK <= '0'; wait for 10 NS;
end process;

process
begin
  wait until START = '1'; -- wait until START is high
  
  for i in 1 to 10 loop -- then wait for a few clock periods...
    wait until rising_edge(CLK);
  end loop;

  for i in 1 to 10 loop 	-- write numbers 1 to 10 to DATA, 1 every cycle
    DATA <= to_unsigned(i, 8);
    wait until rising_edge(CLK);
  end loop;

  -- wait until the output changes
  wait on RESULT;
  
  -- now raise ACK for clock period
  ACK <= '1';
  wait until rising_edge(CLK);
  ACK <= '0';

  -- and so on...
end process;

