# 8-bit ALU
## Design
This code implements an 8-bit ALU (Arithmetic Logic Unit) that can perform various arithmetic and logic operations on two 8-bit inputs A and B.

It contains the following components:

- Full Adder
- 8-bit Complement (2's complement) Adder
- Incrementer
- Complement Subtractor
- Decrementer
- Minimum
- Maximum
- Circular Right Shift
- Circular Left Shift
- Circular Right Shift with Feed
- Circular Left Shift with Feed
- Right Replication
- Left Replication

The top level ALU entity takes in inputs A, B and a 4-bit operation code C. It instantiates all the components and based on the operation code, connects the appropriate component output to the ALU result.

The ALU can perform the following 12 operations:

1. Addition
2. Increment
3. Subtraction
4. Decrement
5. Minimum
6. Maximum
7. Circular Right Shift
8. Circular Left Shift
9. Circular Right Shift with Feed
10. Circular Left Shift with Feed
11. Right Replication
12. Left Replication

All components are implemented using structural VHDL.

## Testbench
The testbench entity alu_test instantiates the ALU component and stimulates it with different input combinations to verify the functionality.

The process in the testbench architecture loops through all the operations, providing different input values for A and B.

The output result is checked against expected results to ensure correct working.

All the operations are thoroughly tested with different edge case inputs.

The testbench provides a way to simulate and validate the ALU design before synthesis/implementation.
