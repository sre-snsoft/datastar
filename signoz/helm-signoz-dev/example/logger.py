import time

def log_with_sequence():
    sequence = 1
    while True:
        print(f"Log entry number: {sequence}")
        sequence += 1
        time.sleep(1)

if __name__ == "__main__":
    log_with_sequence()

