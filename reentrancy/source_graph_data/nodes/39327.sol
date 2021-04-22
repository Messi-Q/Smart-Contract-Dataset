C1 C1 NoLimit NULL 1 Core
N1 N1 NoLimit C1 2 Normal
N2 N2 NoLimit N1 3 Normal
N3 N3 NoLimit N2 4 Normal
N4 N4 NoLimit N2,N3 5 Normal
C2 C2 NoLimit N4 6 CoreCall
N5 N5 NoLimit C2 7 Normal
C3 C3 NoLimit N5,C3,N4,C3 8 Core