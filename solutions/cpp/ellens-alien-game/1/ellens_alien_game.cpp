namespace targets {
    class Alien {
        private:
            int health = 3;
    
        public:
            int x_coordinate, y_coordinate;

            Alien(int x, int y) : x_coordinate(x), y_coordinate(y) {}

            int get_health() { 
                return health; 
            }
            
            bool hit() {
                if (health > 0) {
                    health--;
                }
                return true; // Per instructions, always returns true for now
            }

            bool is_alive() {
                return health > 0;
            }

            bool teleport(int x_new, int y_new) {
                x_coordinate = x_new;
                y_coordinate = y_new;
                return true;
            }

            bool collision_detection(const Alien& other) {
                return x_coordinate == other.x_coordinate && 
                       y_coordinate == other.y_coordinate;
            }
    };
}  // namespace targets
