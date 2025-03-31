# Import necessary libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Load Netflix data into pandas DataFrame
df = pd.read_csv('netflix_data.csv')

# Step 1: Inspect the first few rows of the data
print("Initial Data:")
print(df.head())

# Step 2: Check for missing values
print("\nMissing Values:")
print(df.isnull().sum())


# Step 3: Handle missing values (if any)
# For simplicity, let's drop rows with missing 'title' or 'rating' values
df.dropna(subset=['title', 'rating'], inplace=True)

# Step 4: Convert 'date_added' column to datetime format
df['date_added'] = pd.to_datetime(df['date_added'], errors='coerce')

# Step 5: Data type conversion - Convert 'duration' (e.g., '90 min') to integer minutes
df['duration'] = df['duration'].str.replace(' min', '').astype(int)

# Step 6: Filter out movies released before 2000
df = df[df['release_year'] >= 2000]

# Step 7: Group by 'country' and calculate the number of movies available by country
movies_by_country = df['country'].value_counts().head(10)
print("\nTop 10 countries with most movies:")
print(movies_by_country)

# Step 8: Visualization of movies by country (Top 10)
plt.figure(figsize=(10, 6))
sns.barplot(x=movies_by_country.index, y=movies_by_country.values)
plt.title('Top 10 Countries with Most Movies')
plt.xlabel('Country')
plt.ylabel('Number of Movies')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

# Step 9: Top 5 movie genres in 'listed_in'
top_genres = df['listed_in'].value_counts().head(5)
print("\nTop 5 Genres:")
print(top_genres)

# Step 10: Visualization of top 5 genres
plt.figure(figsize=(10, 6))
sns.barplot(x=top_genres.index, y=top_genres.values)
plt.title('Top 5 Movie Genres on Netflix')
plt.xlabel('Genre')
plt.ylabel('Number of Movies')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

# Step 11: Average movie duration by rating
avg_duration_by_rating = df.groupby('rating')['duration'].mean().sort_values(ascending=False)
print("\nAverage Duration by Rating:")
print(avg_duration_by_rating)

# Step 12: Visualization of average movie duration by rating
plt.figure(figsize=(10, 6))
sns.barplot(x=avg_duration_by_rating.index, y=avg_duration_by_rating.values)
plt.title('Average Movie Duration by Rating')
plt.xlabel('Rating')
plt.ylabel('Average Duration (minutes)')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

# Step 13: Distribution of movie ratings
plt.figure(figsize=(10, 6))
sns.countplot(x='rating', data=df, order=df['rating'].value_counts().index)
plt.title('Distribution of Movie Ratings')
plt.xlabel('Rating')
plt.ylabel('Count')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()

# Step 14: Find the most recent movies
recent_movies = df[df['release_year'] == df['release_year'].max()]
print("\nMost Recent Movies (Release Year):")
print(recent_movies[['title', 'release_year']].head())

# Step 15: Save cleaned data to a new CSV file
df.to_csv('cleaned_netflix_data.csv', index=False)
print("\nCleaned data saved as 'cleaned_netflix_data.csv'")
