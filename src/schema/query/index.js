const {
  db
} = require('../../config/db')
const {
  categories
} = require('../type/category')

const {
  GraphQLObjectType,
  GraphQLString,
  GraphQLList
} = require('graphql')

const QueryRoot = new GraphQLObjectType({
  name: 'RootQueryType',
  type: 'Query',
  fields: () => ({
    categories: {
      type: GraphQLList(categories),
      resolve(root, args) {
        return db.query('SELECT * from catagories').then(rs => rs).catch(er => er)
      }
    },
    hello: {
      type: GraphQLString,
      resolve: () => "Hello world!"
    }
  })
})

module.exports = QueryRoot