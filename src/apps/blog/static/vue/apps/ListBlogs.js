var app = new Vue({
    delimiters: ["[*", "*]"],
    el: '#blogs',
    data: {
        list_blogs: null,
        loading: true,
        errored: false
    },
    mounted: function () {
        this.GetDataListBlogs()
        console.log('list_blogs', this.list_blogs)
      },
    filters: {
        dateformat: function(value) {
            const date_format = new Date(value).toDateString()
            return date_format;
        }
    },
    methods: {
        GetDataListBlogs: function(){
            var url = 'api/v1.0/api-blog'; 
            axios.get(url)
                .then(response => {
                    this.list_blogs = response.data.results
                    console.log('response', response.data.results)
                    
                })
                .catch(error => {
                    console.log(error);
                })
                .finally(() => this.loading = false)
            }
    }
    })