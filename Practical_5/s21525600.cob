IDENTIFICATION DIVISION.
PROGRAM-ID. array.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 arr.
05 arr-item PIC 9 OCCURS 5 TIMES.

01 i PIC 9.
01 j PIC 9.

01 smallest PIC 9.
01 largest PIC 9.
01 mode_value PIC 9.

01 count_value PIC 9.
01 max PIC 9.

PROCEDURE DIVISION.
BEGIN.
    PERFORM readData
    PERFORM findSmallest
    PERFORM findLargest
    PERFORM findMode

    DISPLAY "Smallest: " smallest
    DISPLAY "Largest: " largest
    DISPLAY "Mode: " mode_value

    STOP RUN.

readData.
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > 5
        ACCEPT arr-item (i)
    END-PERFORM.

findSmallest.
    MOVE arr-item(1) TO smallest.

    PERFORM VARYING i FROM 2 BY 1 UNTIL i > 5
        IF arr-item(i) < smallest THEN
            MOVE arr-item(i) TO smallest
        END-IF
    END-PERFORM.

findLargest.
    MOVE arr-item(1) TO largest.

    PERFORM VARYING i FROM 2 BY 1 UNTIL i > 5
        IF arr-item(i) > largest THEN
            MOVE arr-item(i) TO largest
        END-IF
    END-PERFORM.

findMode.
    MOVE 0 TO max

    PERFORM VARYING i FROM 1 BY 1 UNTIL i > 5
        MOVE 0 TO count_value

        PERFORM VARYING j FROM 1 BY 1 UNTIL j > 5
            IF arr-item (j) = arr-item (i) THEN
                ADD 1 TO count_value
            END-IF
        END-PERFORM

        IF count_value > max THEN
            MOVE count_value TO max
            MOVE arr-item (i) TO mode_value
        END-IF
    END-PERFORM.
