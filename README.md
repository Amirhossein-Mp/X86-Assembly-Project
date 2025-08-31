## X86 Assembly Project – Computer Architecture & Languages Course

This repository contains the source codes and materials for the Computer Architecture and Languages course project, implemented in X86 Assembly Language.
---

## Problems

### **1. Time Addition **
- **Task:** Write an x86 assembly program that adds two given timestamps.  
- **Input:** Two consecutive lines, each with:  
  ```
  YYYY MM DD HH MM SS
  ```  
- **Rules for carry-over:**  
  - 60 seconds = 1 minute  
  - 60 minutes = 1 hour  
  - 24 hours = 1 day  
  - 30 days = 1 month  
  - 12 months = 1 year  
- **Output:** Sum of the two input times in the same format.  

**Example Input:**
```
1380 02 21 10 21 52
2221 12 10 01 00 08
```
**Example Output:**
```
3602 03 01 11 22 00
```

---

### **2. Base Conversion **
- **Task:** Convert numbers from base **p** to base **q**.  
- **Input:**  
  - First line: number of inputs `n`.  
  - Next `n` lines: three numbers `p q r`, meaning number `r` in base `p` should be converted to base `q`.  
  - Constraint: `p, q ≤ 10`.  
- **Output:** For each input, print the converted number in base `q`.  

**Example Input:**
```
1
2 5 1010
```
**Example Output:**
```
20
```

---

### **3. Palindromes in Decimal and Binary **
- **Task:** Find numbers less than `n` that are palindromes in **both decimal and binary** representations.  
- **Input:** One integer `n (n ≤ 2 × 10^9)`.  
- **Output:** Print each qualifying number in a new line.  

**Example Input:**
```
400
```
**Example Output:**
```
0
1
3
5
7
9
33
99
313
```

---

### **4. Conjugate of Complex Numbers in Polar Form **
- **Task:** Write an assembly program that:  
  - Takes two complex numbers in **rectangular form** (`α + βi`).  
  - Computes the division of a number by its conjugate.  
  - Converts result into **polar/exponential form** (`r × e^(βi)`).  
- **Hint:** Use Taylor series expansion for computing cosine and sine.  
- **Output Format:** Must show multiplication with `×` and exponential `e`.  

**Example Input:**
```
5 + 3i
7 + 2i
```
**Example Output:**
```
0.800 × e^(-0.262i)
```

---

## ✅ Summary
This project consists of **4 assembly programming problems** ranging from **easy time manipulation** to **very advanced complex number transformations using polar coordinates**.
