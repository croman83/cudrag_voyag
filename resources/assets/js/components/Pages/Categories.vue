<template>
    <div>
        <h1>{{ $t('catalog') }}</h1>
        <div class="cat-wrapper">
            <div class="cat-block" v-for="(item,index) in categories">
                <el-ramka>
                    <div class="cat-block-in" :style="{backgroundImage:'url(/storage/'+item.image+')'}">
                        <router-link :to="{name:'catalog',params:{slug:item.slug ? item.slug : '#'}}" class="cat-block-link">
                            <h4 class="cat-block-title" v-text="item['name']"></h4>
                        </router-link>
                    </div>
                </el-ramka>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                categories:window.config.categories,
                lang:window.config.locale,
            }
        },
        head:{
            title:{
                inner: 'Decor CuDrag',
                separator:' ',
            },
            meta: [
                { name: 'application-name', content: 'CuDrag' }
            ]
        },
        methods:{

        },
        components:{
            elRamka: require('./../Elements/Ramka.vue')
        },
        mounted(){
//            this.getData();
        }
    }
</script>
<style lang="less" scoped>
    .flex(@row: row,@wrap: nowrap,@justify: flex-start,@align: stretch) {
        display: flex;
        flex-flow:@row @wrap;
        justify-content: @justify;
        align-items: @align;
    }
    .screen(@min, @max, @ruleset) {
        @media (min-width: @min) and (max-width: (@max - 1)) {
            @ruleset();
        }
    }
    .container{
        margin-left: auto;
        margin-right: auto;
        .screen(2px, 1270px,{
            width: 100%;
            padding-left: 15px;
            padding-right: 15px;
            min-width: 320px;
        });
        .screen(1270px, 9000000px, {
            width: 1170px;
            padding-left: 15px;
            padding-right: 15px;
        });
    }
    .cat{
        &-wrapper{
            .container;
            .flex(row,wrap,flex-start,flex-start);
            margin-top:25px;
            margin-bottom:50px;
        }
        &-block{
            width:~'calc(100% / 3 - 50px)';
            margin: 25px;
            &-link{
                display: block;
                height:100%;
                pointer-events:all;
            }
            &-in{
                height:230px;
                position: relative;
                background-repeat:no-repeat;
                background-position: center;
                background-size:cover;
            }
            &-title{
                position: absolute;
                right:0;
                text-align: center;
                background-color: #fff;
                color:black;
                font-family: 'Gabriela', serif;
                font-size:25px;
                line-height:1.2;
                font-weight:400;
                top:20%;
                z-index:2;
            }
        }
    }
    h1{
        .container;
        font-family:'Gabriela',serif;
        font-size:25px;
        font-weight:normal;
        margin-bottom:0;
        margin-top:35px;
        line-height:1.2;
    }


</style>