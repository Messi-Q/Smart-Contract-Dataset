N1 N1 NULL NULL 1 Normal
N2 N2 NULL N1,C2,N2 2 Normal
N3 N3 NULL N2 3 Normal
C1 C1 NULL N3 4 Core
C2 C2 Add C1 5 Core
C3 C3 Mul N2,N4 6 Core
N4 N4 NULL C3 7 Normal
N5 N5 NULL N4,C3 8 Normal