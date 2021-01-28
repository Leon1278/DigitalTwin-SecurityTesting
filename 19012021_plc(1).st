PROGRAM SIS
  VAR
    raw_pressure AT %IW100 : INT := 3100;
    setpoint AT %QW1 : INT := 3000;
    efflux AT %QX0.0 : BOOL;
  END_VAR
  VAR
    GT3_OUT : BOOL;
  END_VAR

  GT3_OUT := GT(raw_pressure, setpoint);
  efflux := GT3_OUT;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : SIS;
  END_RESOURCE
END_CONFIGURATION
