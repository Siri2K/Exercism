#include <string>

namespace log_line {
std::string message(std::string line) {
    return line.substr(line.find(":")+2);
}

std::string log_level(std::string line) {
    int strStart = line.find("[");
    int strEnd = line.find("]");
    return line.substr(strStart+1,strEnd-1);
}

std::string reformat(std::string line) {
    // Acquire Log_level & Message
    std::string log_lvl = log_level(line);
    std::string msg = message(line);

    // replace [] with ()
    for (size_t i = 0; i < log_lvl.length(); ++i) {
        if (log_lvl[i] == '[') {
            log_lvl[i] = '('; // In-place replacement using operator[]
        }
        else if(log_lvl[i] == ']'){
            log_lvl[i] = ')'; // In-place replacement using operator[]
        }
    }

    // Concantenatinate strings
    return (msg + " (" + log_lvl + ")");
    
}
}  // namespace log_line
