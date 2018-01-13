<template>
    <div class="blog-wrap">
        <h1 class="blog-title">{{ $t('blog') }}</h1>
        <div class="block" v-for="post in posts">
            <div class="block-img">
                <ramka>
                    <router-link :to="'blog/'+post.slug" class="block-link">
                        <img :src="'/storage/'+post.image" alt="">
                    </router-link>
                </ramka>
            </div>
            <div class="block-text">
                <h2 class="title">
                    <router-link :to="'blog/'+post.slug" class="block-link" v-text="post['title_'+lang]"></router-link>
                </h2>
                <div class="text" v-html="post['description_mini_'+lang]"></div>
                <div class="data" v-text="post['created_at']"></div>
            </div>
        </div>
    </div>
</template>
<script>
    import Ramka from './../Elements/Ramka.vue'
    export default {
        data(){
            return {
                posts:[],
                lang:window.config.locale,
            }
        },
        components:{
            Ramka
        },
        methods:{
            getData(){
                this.$http.get('/api/blog-list')
                    .then(response=>{
                        this.posts = response.data.data;
                    }), response => { };
            }
        },
        mounted(){
            this.getData();
        }
    }
</script>
<style scoped lang="less">
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";
    .blog{
        &-wrap{
            width:@s1400;
            margin:50px auto;
        }
        &-title{
            font-family: @font-gabriela;
            font-size:35px;
            font-weight:400;
            line-height:1.3;
        }
    }
    .block{
        .flex(row,nowrap,space-between,flex-start);
        margin-bottom:50px;
        &-link{
            pointer-events: all;
            img{
                max-width:600px;
                width:100%;
            }
        }
        &-text{
            width:70%;
        }
        &-img{
            width:25%;
        }
    }

</style>