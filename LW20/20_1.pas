PROGRAM PseudoArt(INPUT, OUTPUT);
CONST
  SupportedLetter = ['A', 'B', 'C'];
  LetterA = [3, 7, 9, 12 .. 14, 17, 19, 22, 24];
  LetterB = [1 .. 3, 6, 9, 11..13, 16, 19, 21..23];
  LetterC = [2..4, 6, 10, 11, 16, 20, 22..24];
  X1 = 1;
  X2 = 25;
  MatrixLength = 5;
  PaintLetter = '*';
  SpaceLetter = ' ';
TYPE
  PatSet = SET OF X1..X2;

PROCEDURE WriteLetter(VAR FOut: TEXT; Pattern: PatSet);
VAR
  Position: INTEGER;
BEGIN {WriteLetter}
  FOR Position := X1 TO X2
  DO
    BEGIN  {FOR}
      IF Position IN Pattern
      THEN
        WRITE(PaintLetter)
      ELSE
        WRITE(SpaceLetter);
      IF Position MOD MatrixLength = 0
      THEN
        WRITELN(FOut)
    END;   {FOR}
  WRITELN(FOut)
END;   {WriteLetter}

PROCEDURE ChoosePatternAndWrite(VAR FOut: TEXT; VAR ChIn: CHAR);
BEGIN
  CASE ChIn OF
    'A': WriteLetter(FOut, LetterA);
    'B': WriteLetter(FOut, LetterB);
    'C': WriteLetter(FOut, LetterC);
  ELSE
    WRITELN('‘¨¬¢®« ', ChIn, ' ­¥ ­ å®¤¨âáï ¢ á¯¨áª¥ ®¡à ¡ âë¢ ¥¬ëå');
    WRITELN
  END
END;


FUNCTION IsLetterSupported(VAR ChIn: CHAR): BOOLEAN;
BEGIN  {IsLetterSupported}
  IF ChIn IN SupportedLetter
  THEN
    IsLetterSupported := TRUE
  ELSE
    IsLetterSupported := FALSE
END;    {IsLetterSupported}

VAR
  Ch: CHAR;

BEGIN {PseudoArt}  
  WRITELN('‚¢¥¤¨â¥ á«®¢® ¨§ ­ ¡®à  á¨¬¢®«®¢ ¨§ á«¥¤ãîé¥£® á¯¨áª : A, B, C'); 
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN                                                        
      READ(INPUT, Ch);
      IF IsLetterSupported(Ch)
      THEN
        ChoosePatternAndWrite(OUTPUT, Ch)
      ELSE
        BEGIN
          WRITELN('‘¨¬¢®« ', Ch, ' ­¥ ­ å®¤¨âáï ¢ á¯¨áª¥ ®¡à ¡ âë¢ ¥¬ëå');
          WRITELN
        END
    END
END.   {PseudoArt}

