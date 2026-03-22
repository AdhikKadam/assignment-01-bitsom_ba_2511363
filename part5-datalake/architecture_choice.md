## Architecture Recommendation

For a fast-growing food delivery startup with GPS location logs, customer text reviews, payment transactions, and restaurant menu images, a Data Lakehouse architecture would be best because:

1. Mixed data types: The startup has structured payment records, semi-structured GPS and reviews, and unstructured images. Data Lakehouse supports all formats in one unified platform, making it easier to store and query without rigid schema upfront.

2. Speed and analytics: Data Lakehouse can manage both batch and near-real-time ingestion (useful for location streams and delivery tracking) while providing query performance for analytics and reporting (e.g., total revenue, ratings by area) through optimizations like indexing and caching.

3. Governed flexibility: Lakehouse introduces data governance and ACID transaction support on top of lake storage. This is critical for payment transactions and sensitive customer data, while still allowing exploration by data science teams on GPS/review text data.