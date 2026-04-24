module matrix
  implicit none

contains

  function row(matrix, dims, i) result(r)
    integer, dimension(2), intent(in) :: dims
    character(len=*), dimension(dims(1)), intent(in) :: matrix
    integer, intent(in) :: i
    integer, dimension(dims(2)) :: r
    
    ! Read the i-th string (row) directly into the integer array r
    ! Fortran's 'read' can parse a whole row of space-separated integers at once
    read(matrix(i), *) r
  end function

  function column(matrix, dims, j) result(c)
    integer, dimension(2), intent(in) :: dims
    character(len=*), dimension(dims(1)), intent(in) :: matrix
    integer, intent(in) :: j
    integer, dimension(dims(1)) :: c
    
    integer :: row_idx
    integer, dimension(dims(2)) :: temp_row
    
    ! Loop through every row string
    do row_idx = 1, dims(1)
      ! Parse the current row string into a temporary integer array
      read(matrix(row_idx), *) temp_row
      ! Extract the j-th element for our column result
      c(row_idx) = temp_row(j)
    end do
  end function

end module