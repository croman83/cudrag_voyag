<template>
    <div class="container">
        <h1>{{ page['name_'+lang] }}</h1>
        <div class="editor" v-html="page['description_'+lang]"></div>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                page:[],
                lang:config.locale,
            }
        },
        methods:{
            getData(){
                this.$http.get('/api/contacts')
                    .then(response=>{
                        this.page = response.data;
                    }), response => { };
            }
        },
        created(){
            this.getData();
        }
    }
</script>
<style lang="less" scoped>
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";
</style>