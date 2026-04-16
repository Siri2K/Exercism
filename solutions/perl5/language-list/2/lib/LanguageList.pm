package LanguageList;

use v5.40;

our @Languages;

sub add_language ($language) {
    push(@Languages, $language);
    return;
}

sub remove_language () {
    pop(@Languages);
    return;
}

sub first_language () {
    return $Languages[0]; # Use $ for single element
}

sub last_language () {
    return $Languages[-1]; # Use $ for single element
}

sub get_languages (@elements) {
    my @indices = map { $_ - 1 } @elements;
    return @Languages[@indices];
}

sub has_language ($language) {
    foreach my $item (@Languages) {
        if ($item eq $language) { # 'eq' for strings, '==' for numbers
            return 1; 
        }
    }
    return 0;
}

1;