const fs = require('fs');
const path = require('path');

const dbPath = path.join(__dirname, '.db', 'db.json');
let data = fs.readFileSync(dbPath, 'utf8');

data = data.replace(/Makbook/g, 'MacBook');
data = data.replace(/Ziaomi/g, 'Xiaomi');
data = data.replace(/Samusung/g, 'Samsung');
data = data.replace(/Azsus/g, 'Asus');
data = data.replace(/iPhon 11/g, 'iPhone 11');

fs.writeFileSync(dbPath, data, 'utf8');
console.log('Fixed typos in db.json');
