<template>
    <div class="prt container">
        <e-title :square="true">
            <router-link to="/partners"><h4 class="prt-title">{{ $t('our_partners') }}</h4></router-link>
        </e-title>
        <div class="prt-wrap">
            <div class="prt-block"
                 :class="makeCol(index)"
                 v-for="(item,index) in partners" >
                <e-ramka>
                    <div class="img" :style="{backgroundImage:'url(/storage/'+item.category_image+')'}"></div>
                </e-ramka>
                <div class="text">
                    <router-link :to="'/partners/'+item.slug" class="title">{{ item['title_'+lang] }}</router-link>
                    <div class="text-in" v-html="item['description_mini_'+lang]"></div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                partners:[],
                lang:window.config.locale,
            }
        },
        methods:{
            makeCol(index){
                let simb = false;
                if(index%2 === 0){
                    simb = true;
                }
                return {right:simb};
            },
            getData(){
                this.$http.get('/api/partners_short')
                    .then(response=>{
                        this.partners = response.data.data;
                    }), response => { };
            }
        },
        components:{
            eTitle:require('./Title'),
            eRamka:require('./Ramka')
        },
        mounted(){
            this.getData();
        }
    }
</script>
<style lang="less" scoped>
    .prt{
        margin:50px auto;
        padding-top:50px;
        &-title{
            font-size:30px;
            font-weight:100;
            text-transform:uppercase;
            line-height:1.2;
            margin:0;
            color:black;
            position: relative;
            overflow: hidden;
            &:hover{
                &:after{
                    right:0;
                }
            }
            &:after{
                content:'';
                position: absolute;
                width:100%;
                border-bottom:1px solid black;
                right:100%;
                top:70%;
                transition:all 0.3s;
            }
        }
        &-block{
            display: flex;
            flex-flow:row nowrap;
            margin:75px 0;
            &.right{
                &>div{
                    order:1;
                }
                .text{
                    order:2;
                }
            }
            &>div{
                width:30%;
                order:2;
            }
            .text{
                width:70%;
                order:1;
                padding:0 3vw;
                text-align: center;
                .title{
                    font-family: 'Gabriela', serif;
                    font-size:25px;
                    display: inline-block;
                    background-color: #ff99cc;
                    line-height:1.2;
                    margin-bottom:25px;
                    color:black;
                    &:before{
                        content:'«';
                    }
                    &:after{
                        content:'»';
                    }
                }
                &-in{
                    text-align: left;
                    font-size:16px;
                    font-weight:300;
                    line-height:1.375;
                    height:170px;
                    position: relative;
                    overflow: hidden;
                    &:after{
                        content:'';
                        position: absolute;
                        bottom:0;
                        left:0;
                        width:100%;
                        height: 50px;
                        background: linear-gradient(to top,white,transparent);
                        pointer-events: none;
                    }
                }
            }
            .img{
                height: 250px;
                background-repeat:no-repeat;
                background-position: center;
                background-size:cover;
            }
        }
    }
</style>