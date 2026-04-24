module nth_prime
  implicit none

contains

  integer function prime(n)
    integer, intent(in) :: n
    integer :: count, candidate, i
    logical :: is_prime

    ! Handle invalid input
    if (n <= 0) then
       prime = -1 ! Or follow specific Exercism error handling
       return
    end if

    if (n == 1) then
      prime = 2
      return
    end if

    count = 1      ! We already counted the number 2
    candidate = 1  ! Start checking from 3 (candidate + 2)

    do while (count < n)
      candidate = candidate + 2
      is_prime = .true.
      
      ! Primality test: check divisors up to sqrt(candidate)
      do i = 3, int(sqrt(real(candidate))), 2
        if (mod(candidate, i) == 0) then
          is_prime = .false.
          exit
        end if
      end do

      if (is_prime) then
        count = count + 1
      end if
    end do

    prime = candidate
  end function prime

end module nth_prime