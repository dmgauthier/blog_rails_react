import React from 'react'

const Articles = ({articles}) => {

    if (!articles) {
       return null 
    }
 
   return articles.map((article) => 
 
      (<div key={article.title}>
          <h1>Ceci est un article</h1>
            <h2>{article.title}</h2>
            <p>{article.body}</p>
        </div>)
    )
}

export default Articles