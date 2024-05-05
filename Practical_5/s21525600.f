MODULE array_module
    IMPLICIT NONE
    CONTAINS

    SUBROUTINE readData(arr)
        INTEGER, DIMENSION(:), INTENT(INOUT) :: arr
        INTEGER :: i

        DO i = 1, SIZE(arr)
            READ *, arr(i)
        END DO
    END SUBROUTINE readData

    FUNCTION findSmallest(arr)
        INTEGER, DIMENSION(:), INTENT(IN) :: arr
        INTEGER :: findSmallest

        findSmallest = MINVAL(arr)
    END FUNCTION findSmallest

    FUNCTION findLargest(arr)
        INTEGER, DIMENSION(:), INTENT(IN) :: arr
        INTEGER :: findLargest

        findLargest = MAXVAL(arr)
    END FUNCTION findLargest

    FUNCTION mode(arr)
        INTEGER, DIMENSION(:), INTENT(IN) :: arr
        INTEGER :: mode, i, j, maxCount, count

        maxCount = 0
        mode = arr(1)

        DO i = 1, SIZE(arr)
            count = 0
            DO j = 1, SIZE(arr)
                IF (arr(i) == arr(j)) THEN
                    count = count + 1
                END IF
            END DO
            IF (count > maxCount) THEN
                maxCount = count
                mode = arr(i)
            END IF
        END DO
    END FUNCTION mode
END MODULE array_module

PROGRAM array
    USE array_module
    IMPLICIT NONE
    INTEGER, DIMENSION(5) :: arr
    INTEGER :: smallest, largest, mode_value

    CALL readData(arr)
    smallest = findSmallest(arr)
    largest = findLargest(arr)
    mode_value = mode(arr)

    PRINT *, 'Smallest: ', smallest
    PRINT *, 'Largest: ', largest
    PRINT *, 'Mode: ', mode_value
END PROGRAM array
