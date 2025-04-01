# Overlap

Quick script arising from a photographer sending all raw images, and friends choosing their favourites and placing into separate folders. This'll compile the most popular choices.

I created a Dockerfile to protect my host machine from any unintentionally malicious script code that I wrote in the process.

## Usage
1. Add choices to separate folders.
2. Add choice folders to the `selects` folder.
3. Run the following command:
   ```sh
   docker build -t overlap . && docker run --rm overlap > overlap.csv
   ```
