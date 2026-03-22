const { MongoClient } = require('mongodb');
const fs = require('fs');

// Connection URL
const url = 'mongodb://localhost:27017';
const client = new MongoClient(url);

// Database Name
const dbName = 'ecommerce';
const collectionName = 'products';

async function main() {
  try {
    await client.connect();
    console.log('Connected successfully to server');

    const db = client.db(dbName);
    const collection = db.collection(collectionName);

    // OP1: insertMany() — insert all 3 documents from sample_documents.json
    const sampleData = JSON.parse(fs.readFileSync('./sample_documents.json', 'utf8'));
    const insertResult = await collection.insertMany(sampleData);
    console.log('Inserted documents:', insertResult.insertedCount);

    // OP2: find() — retrieve all Electronics products with price > 20000
    const electronicsExpensive = await collection.find({ category: 'Electronics', price: { $gt: 20000 } }).toArray();
    console.log('Electronics products with price > 20000:', electronicsExpensive);

    // OP3: find() — retrieve all Groceries expiring before 2025-01-01
    const groceriesExpiring = await collection.find({ category: 'Groceries', expiry_date: { $lt: '2025-01-01' } }).toArray();
    console.log('Groceries expiring before 2025-01-01:', groceriesExpiring);

    // OP4: updateOne() — add a "discount_percent" field to a specific product
    const updateResult = await collection.updateOne(
      { _id: 'electronics_001' },
      { $set: { discount_percent: 10 } }
    );
    console.log('Updated document count:', updateResult.modifiedCount);

    // OP5: createIndex() — create an index on category field and explain why
    
    // Creating an index on the 'category' field improves query performance for operations that filter by category,
    // such as finding all products in a specific category. This is especially useful in an e-commerce platform
    // where category-based searches are common, reducing lookup time from O(n) to O(log n).
    const indexResult = await collection.createIndex({ category: 1 });
    console.log('Index created on category:', indexResult);

  } finally {
    await client.close();
  }
}

main().catch(console.error);
