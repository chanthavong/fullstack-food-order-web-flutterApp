const {
  GraphQLString,
  GraphQLInt,
  GraphQLObjectType,
  GraphQLNonNull
} = require('graphql')

const categories = new GraphQLObjectType({
  name: 'categories',
  type: 'Query',
  fields: {
    id: {
      type: GraphQLInt
    },
    category_name: {
      type: GraphQLString
    },
    created_at: {
      type: GraphQLString
    },
    updated_at: {
      type: GraphQLString
    }
  }
})

module.exports = {
  categories
}