SET     A -> 0
MEMSET  1
SET     A -> 1
MEMSET  0
SET     A -> 1           .L0
SET     D -> D + M
SET     A -> 0
jmpLT   D
SET     OUT -> D
SET     A -> 2
MEMSET  D
SET     A -> 0
MEMLD   D
SET     A -> 1
MEMSET  D
SET     A -> 2
MEMLD   D
SET     A -> 0
MEMSET  D
JMP     .L0
