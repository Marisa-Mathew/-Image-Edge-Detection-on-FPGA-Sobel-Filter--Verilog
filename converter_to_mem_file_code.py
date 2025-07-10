from PIL import Image
import numpy as np

# === Step 1: Load and resize your image ===
img = Image.open("flower.jpg").convert("L")  # Convert to grayscale
img = img.resize((64, 64))  # Resize to 64x64
img_np = np.array(img)

# === Step 2: Save as Verilog .mem file ===
with open("flower_image_64x64.mem", "w") as f:
    for row in img_np:
        for pixel in row:
            f.write(f"{pixel:02x}\n")  # Write each pixel in 2-digit hex
print(" flower_image_64x64.mem file created successfully.")
import matplotlib.pyplot as plt

plt.imshow(img_np, cmap='gray')
plt.title("Grayscale Input Flower Image (64x64)")
plt.axis('off')
plt.show()
