class UpDownCounter2Bit:
    def __init__(self, initial_state=0):
        self.state = initial_state  # Set the initial state
    
    def reset_incrementing(self):
        self.state = 0  # Reset to state 0
    
    def reset_decrementing(self):
        self.state = 3  # Reset to state 3

    def up_count(self):
        if self.state == 0:
            self.state = 1
        elif self.state == 1:
            self.state = 2
        elif self.state == 2:
            self.state = 3
        else:
            self.state = 0
    
    def down_count(self):
        if self.state == 0:
            self.state = 3
        elif self.state == 1:
            self.state = 0
        elif self.state == 2:
            self.state = 1
        else:
            self.state = 2

    def get_state(self):
        return self.state

# Create an instance of the UpDownCounter2Bit class with an initial state of 2 (binary 10).
counter = UpDownCounter2Bit(initial_state=3)

# Define test inputs
test_inputs = [
    ("Up Count", 4),  # Up Count 4 times
    ("Reset Decrementing", 1),  # Reset when decrementing
    ("Up Count", 3),  # Up Count 3 times
    ("Reset Incrementing", 1),  # Reset when incrementing
]

# Helper function to convert decimal to one-hot encoding
def to_one_hot(decimal):
    one_hot = [0] * 4  # Initialize a list of zeros for 4 bits
    one_hot[decimal] = 1  # Set the corresponding bit to 1
    return one_hot

# Save the inputs step by step to a separate file
with open("counter_input.txt", "w") as input_file:
    input_file.write("Step\tInput\n")
    step = 1
    for operation, count in test_inputs:
        for _ in range(count):
            input_file.write(f"{step}\t{operation}\n")
            step += 1

# Simulate the counter and record states, outputs, and input state
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
        elif operation == "Reset Decrementing":
            counter.reset_decrementing()
        elif operation == "Reset Incrementing":
            counter.reset_incrementing()
        result.append(to_one_hot(counter.get_state()))
        results.append(result)
        result = [None, None]  # Reset to None to avoid duplicate entries

# Write the results to separate output files for input and states
with open("counter_output.txt", "w") as output_file:
    output_file.write("Input\tOutput\n")
    for result in results:
        input_operation = result[0]
        if input_operation:
            output_str = " ".join(map(str, result[1]))
            output_file.write(f"{input_operation}\t{output_str}\n")

# Save the counter states to a separate file
with open("counter_states.txt", "w") as states_file:
    states_file.write("Step\tState\n")
    for step, state in enumerate(results, start=1):
        states_file.write(f"{step}\t{state[1]}\n")

print("Results saved to 'counter_input.txt', 'counter_output.txt', and 'counter_states.txt'")
