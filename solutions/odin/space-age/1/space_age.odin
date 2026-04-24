package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

age :: proc(planet: Planet, seconds: int) -> f64 {
	earth_year_in_seconds := 31557600.0
	
	// Map the enum to the orbital period
	orbital_period: f64
	switch planet {
	case .Mercury: orbital_period = 0.2408467
	case .Venus:   orbital_period = 0.61519726
	case .Earth:   orbital_period = 1.0
	case .Mars:    orbital_period = 1.8808158
	case .Jupiter: orbital_period = 11.862615
	case .Saturn:  orbital_period = 29.447498
	case .Uranus:  orbital_period = 84.016846
	case .Neptune: orbital_period = 164.79132
	}

	// You MUST cast 'seconds' to f64 to perform math with other f64 values
	return f64(seconds) / (orbital_period * earth_year_in_seconds)
}