class UpDownCounter2Bit:
    def __init__(self, initial_state=0):
        self.state = initial_state
    
    # Reset the counter to state 0
    def reset_up(self):
        self.state = 0
    
    # Reset the counter to state 3
    def reset_down(self):
        self.state = 3

    # Increment the counter (up counting)
    def up_count(self):
        if self.state == 0:
            self.state = 1
        elif self.state == 1:
            self.state = 2
        elif self.state == 2:
            self.state = 3
        else:
            self.state = 0
    
    # Decrement the counter (down counting)
    def down_count(self):
        if self.state == 0:
            self.state = 3
        elif self state == 1:
            self.state = 0
        elif self.state == 2:
            self.state = 1
        else:
            self.state = 2

    # Get the current state of the counter
    def get_state(self):
        return self.state

# Create an instance of the UpDownCounter2Bit class with an initial state of 3 (binary 11).
counter = UpDownCounter2Bit(initial_state=3)

# Define test inputs with corrected operation names
test_inputs = [
    ("Up Count", 4),   # Perform up counting 4 times
    ("Reset Down", 1), # Reset the counter when down counting
    ("Up Count", 3),   # Perform up counting 3 times
    ("Reset Up", 1),   # Reset the counter when up counting
]

def to_one_hot(decimal):
    one_hot = [0] * 4
    one_hot[decimal] = 1
    return one_hot

# Save the inputs step by step to a separate file
with open("counter_input.txt", "w") as input_file:
    input_file.write("Step\tInput\n")
    step = 1
    for operation, count in test_inputs:
        for _ in range(count):
            input_file.write(f"{step}\t{operation}\n")
            step += 1

results = []
for operation, count in test_inputs:
    result = []
    result.append(operation)
    result.append(to_one_hot(counter.get_state()))
    for _ in range(count):
        if operation == "Up Count":
            counter.up_count()
        elif operation == "Down Count":
            counter.down_count()
        elif operation == "Reset Down":
            counter.reset_down()
        elif operation == "Reset Up":
            counter.reset_up()
        result.append(to_one_hot(counter.get_state()))
        results.append(result)
        result = [None, None]

# Write the results to separate output files for input and states with corrected operation names
with open("counter_output.txt", "w") as output_file:
    output_file.write("Input\tOutput\n")
    for result in results:
        input_operation = result[0]
        if input_operation:
            output_str = " ".join(map(str, result[1])
            output_file.write(f"{input_operation}\t{output_str}\n")

with open("counter_states.txt", "w") as states_file:
    states_file.write("Step\tState\n")
    for step, state in enumerate(results, start=1):
        states_file.write(f"{step}\t{state[1]}\n")

print("Results saved to 'counter_input.txt', 'counter_output.txt', and 'counter_states.txt'")
