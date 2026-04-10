"""Functions to prevent a nuclear meltdown."""


def is_criticality_balanced(temperature, neutrons_emitted):
    """Verify criticality is balanced.

    :param temperature: int or float - temperature value in kelvin.
    :param neutrons_emitted: int or float - number of neutrons emitted per second.
    :return: bool - is criticality balanced?

    A reactor is said to be balanced in criticality if it satisfies the following conditions:
    - The temperature is less than 800 K.
    - The number of neutrons emitted per second is greater than 500.
    - The product of temperature and neutrons emitted per second is less than 500000.
    """

    # Temperature Check
    if(not(temperature < 800)):
        return False

    # Neutron check
    if(not(neutrons_emitted > 500)):
        return False

    # Product Check
    if(not((temperature*neutrons_emitted) < 500000)):
        return False
    
    return True


def reactor_efficiency(voltage, current, theoretical_max_power):
    """Assess reactor efficiency zone.

    :param voltage: int or float - voltage value.
    :param current: int or float - current value.
    :param theoretical_max_power: int or float - power that corresponds to a 100% efficiency.
    :return: str - one of ('green', 'orange', 'red', or 'black').

    Efficiency can be grouped into 4 bands:

    1. green -> efficiency of 80% or more,
    2. orange -> efficiency of less than 80% but at least 60%,
    3. red -> efficiency below 60%, but still 30% or more,
    4. black ->  less than 30% efficient.

    The percentage value is calculated as
    (generated power/ theoretical max power)*100
    where generated power = voltage * current
    """

    # 1. Calculate Efficiency
    efficiency = (voltage * current)/theoretical_max_power * 100

    # 2. Return Color
    if (efficiency >= 80):
        return "green"
    elif (60 <= efficiency < 80):
        return "orange"
    elif (30 <= efficiency < 60):
        return "red"
    elif (efficiency < 30):
        return "black"


def fail_safe(temperature, neutrons_produced_per_second, threshold):
    """Assess and return status code for the reactor.

    :param temperature: int or float - value of the temperature in kelvin.
    :param neutrons_produced_per_second: int or float - neutron flux.
    :param threshold: int or float - threshold for category.
    :return: str - one of ('LOW', 'NORMAL', 'DANGER').

    1. 'LOW' -> `temperature * neutrons per second` < 90% of `threshold`
    2. 'NORMAL' -> `temperature * neutrons per second` +/- 10% of `threshold`
    3. 'DANGER' -> `temperature * neutrons per second` is not in the above-stated ranges
    """

    # 1. Calculate reaction 
    criticality :float = float(temperature*neutrons_produced_per_second)

    # 2. Calculate margin
    low_threshold = 0.9 * threshold
    high_threshold = 1.1 * threshold

    # 3. Return Status code
    if criticality < low_threshold:
        return "LOW"
    if  low_threshold <= criticality <= high_threshold:
        return "NORMAL"
   
    return "DANGER"
