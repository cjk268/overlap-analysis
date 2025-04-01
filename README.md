# Overlap

Quick script arising from a photographer sending all raw images, and friends choosing their favourites and placing into separate folders. This'll compile the most popular choices.

## Usage
1. Add choices to separate folders.
2. Add choice folders to the `selects` folder.
3. Run the following command:
   ```sh
   docker build -t overlap . && docker run --rm overlap > overlap.csv
   ```
