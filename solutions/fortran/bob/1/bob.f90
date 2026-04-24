module bob
  implicit none
contains

  function hey(statement)
    character(len=100) :: hey
    character(len=*), intent(in) :: statement

    logical :: is_silence, is_question, is_yelling, has_letters
    character(len=:), allocatable :: cleaned
    integer :: i, n, last_char_pos

    ! 1. Manually find the "true" content boundaries
    ! We look for the first and last characters with ASCII > 32
    n = len(statement)
    last_char_pos = 0
    do i = n, 1, -1
       if (iachar(statement(i:i)) > 32) then
          last_char_pos = i
          exit
       end if
    end do

    ! 2. Check for Silence
    ! If no character > 32 was found, it's silence
    if (last_char_pos == 0) then
       hey = 'Fine. Be that way!'
       return
    end if

    ! 3. Identify Question (using our last_char_pos)
    is_question = (statement(last_char_pos:last_char_pos) == '?')

    ! 4. Check for Yelling
    ! Scan for any letters; if we find lowercase, it's not yelling.
    ! If we find uppercase but NO lowercase, it IS yelling.
    is_yelling = .false.
    has_letters = .false.
    do i = 1, n
       if (statement(i:i) >= 'a' .and. statement(i:i) <= 'z') then
          is_yelling = .false.
          has_letters = .true.
          exit ! Found lowercase, cannot be yelling
       else if (statement(i:i) >= 'A' .and. statement(i:i) <= 'Z') then
          has_letters = .true.
          is_yelling = .true.
       end if
    end do
    
    ! Final check: Must have had letters to yell (e.g., "123?" is not yelling)
    if (.not. has_letters) is_yelling = .false.

    ! 5. Determine Response
    if (is_yelling .and. is_question) then
       hey = "Calm down, I know what I'm doing!"
    else if (is_yelling) then
       hey = 'Whoa, chill out!'
    else if (is_question) then
       hey = 'Sure.'
    else
       hey = 'Whatever.'
    end if

  end function hey

end module bob