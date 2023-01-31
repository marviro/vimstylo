import requests
import json

accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZpdGFsaXJvc2F0aUBnbWFpbC5jb20iLCJfaWQiOiI1YWM0NWVmNGZkYjA4ZTEwMDBhYjNhMmMiLCJhdXRoVHlwZSI6ImxvY2FsIiwiYWRtaW4iOmZhbHNlLCJzZXNzaW9uIjp0cnVlLCJpYXQiOjE2NjY2MjQ5ODN9.8jJ0k9-UFWDI2RDS0Kn-Q2Z5u9OwbywSRYUDijFZ5F8"

def styloquery(query, variables):

    endpoint = "https://stylo-dev.huma-num.fr/graphql"
    headers = {"Authorization": f"Bearer {accessToken}"}

    r = requests.post(endpoint, json={'query': query , 'variables': variables}, headers=headers)
    if r.status_code == 200:
        #print(json.dumps(r.json(), indent=2))
        return r.json()
    else:
        raise Exception(f"Query failed to run with a {r.status_code}.")
    
renameart = '''
query ($id:ID!, $title: String!)
    {article(article:$id)
    {_id rename(title:$title)}}
    '''

updatewvmd = """
query ($id: ID!, $md: String!) {
  article(article: $id) {
    _id
    updateWorkingVersion(content: {md: $md}) {
      _id
    }
  }
}
"""

getwvmd = """
query ($id:ID!){
  article(article:$id){
    workingVersion{md}
  }
  
}
"""

gai= "{articles{_id title}}"

ui="{user{_id}}"

