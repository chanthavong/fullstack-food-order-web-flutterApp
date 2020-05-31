const express = require('express')
const graphqlHTTP = require('express-graphql')
const graphql = require('graphql')

const QueryRoot = require('./src/schema/query/index.js')

const schema = new graphql.GraphQLSchema({ query: QueryRoot })

const app = express();
app.use('/api', graphqlHTTP({
  schema: schema,
  graphiql: true,
}));
app.listen(4000, 'localhost',()=>console.log('runing on port 4000'))