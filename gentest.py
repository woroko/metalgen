from generator import Sampler

def main():
    metalsampler = Sampler("model.mod")
    print(metalsampler.sample(50, 5))

if __name__ == "__main__":
    main()
