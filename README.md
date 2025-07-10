#  Image Edge Detection Using Sobel Filter (FPGA + Verilog + Python)

This project implements **Sobel edge detection** on grayscale images using **Verilog HDL**, designed and simulated in **Xilinx Vivado 2023.1**, with output visualized using **Python (matplotlib)**.

The edge detection is performed on a `64×64` grayscale image provided via memory initialization (`.mem` file), and the output edges are extracted using a hardware-accurate 3×3 Sobel filter window. This project is ideal for **beginner FPGA enthusiasts** or those exploring **basic computer vision on hardware**.

---

##  Project Structure
sobel-edge-detection-verilog/
├── image_loader.v       #Design Source
├── sobel_filter.v       #Design Source
├── top.v                #Design Source
├── top_tb.v             #Simulation Source
├── image_mem.mem        # mem file 
├── edge_output.txt      # (generated out)
├── mage_out.py


---

##  Tools Used

-  **Xilinx Vivado 2023.1**
-  **Verilog HDL**
- **Python 3.8+**
  - `numpy`
  - `matplotlib`


---

## How It Works

1. `image_loader.v`: Loads a 64×64 grayscale image from `image_mem.mem`
2. `top.v`: Builds a sliding 3×3 pixel window across image data
3. `sobel_filter.v`: Computes horizontal (Gx) and vertical (Gy) gradients
4. `top_tb.v`: Drives simulation, writes edge values to `edge_output.txt`
5. `viewer.py`: Plots the output as an edge-detected image

---

##  Simulation & Usage

### 1. Prepare Your Image

Use the Python script below to convert any image to a 64×64 grayscale `.mem` format:
## Simulate in Vivado
Open Vivado → Create project → Add Verilog sources and image_mem.mem

Set top_tb.v as simulation top

Run Behavioral Simulation → Click Run All

After simulation, edge_output.txt is generated


