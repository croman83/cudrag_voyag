<template>
    <div>
        <div class="menu" @click="show = true">
            <span>{{ $t('menu.menu') }}</span>
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                 width="50px" height="30px" viewBox="0 0 344.339 344.339" style="enable-background:new 0 0 344.339 344.339;"
                 xml:space="preserve">
                <g>
                    <rect y="46.06" width="344.339" height="29.52"/>
                </g>
                <g>
                    <rect y="156.506" width="344.339" height="29.52"/>
                </g>
                <g>
                    <rect y="268.748" width="344.339" height="29.531"/>
                </g>
            </svg>
        </div>
        <transition name="faderouterfront">
            <div class="cat" v-show="show" @click="show = false">
                <div class="cat-content" @click.stop>
                    <div class="cat-lang">
                        <lang></lang>
                    </div>
                    <ul class="cat-menu">
                        <li>
                            <router-link to="/">{{ $t('menu.main') }}</router-link>
                        </li>
                        <li class="deep">
                            <router-link to="/catalog">{{ $t('menu.catalog') }}</router-link>
                            <ul class="cat-deep">
                                <li v-for="category in categories" :key="category.id">
                                    <router-link :to="'/catalog/' + category.slug">{{ category.name }}</router-link>
                                </li>
                            </ul>
                        </li>
                        <li class="deep">
                            <router-link to="/services">{{ $t('menu.services') }}</router-link>
                            <ul class="cat-deep">
                                <li v-for="service in services" :key="service.id">
                                    <router-link :to="'/services/' + service.slug">{{ service.name }}</router-link>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <router-link to="/works">{{ $t('menu.works') }}</router-link>
                        </li>
                        <li>
                            <router-link to="/blog">{{ $t('menu.blog') }}</router-link>
                        </li>
                        <li>
                            <router-link to="/partners">{{ $t('menu.partners') }}</router-link>
                        </li>
                        <li>
                            <router-link to="/contacts">{{ $t('menu.contacts') }}</router-link>
                        </li>
                    </ul>
                    <div class="image" :style="{backgroundImage:'url(/storage/' + categories[0].image + ')'}"></div>
                </div>
            </div>
        </transition>
    </div>
</template>
<script>
    import Lang from './Lang';
    export default {
        data(){
            return{
                show:false,
                categories:window.config.categories ? window.config.categories : [],
                services:window.config.services ? window.config.services : [],
            }
        },
        components:{
            Lang
        }
    }
</script>
<style scoped lang="less">
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";

    .menu{
        .flex(row,nowrap,flex-start,center);
        cursor: pointer;
        padding:10px;
        span{
            font-size:18px;
            font-weight:300;
            text-transform: uppercase;
        }
        svg{
            display: block;
        }
    }
    .cat{
        position: fixed;
        top:0;
        left:0;
        width:100%;
        height:100vh;
        background-color: rgba(0, 0, 0, 0.35);
        .flex(row,nowrap,center,center);
        z-index:99999;
        &-content{
            background-color: #fff;
            .flex(row,wrap,space-between,stretch);
            min-width:50vw;
            padding:25px;
        }
        &-lang{
            width:100%;
            border-bottom:1px solid rgba(140, 140, 140, 0.15);
            padding:0 5px 15px 5px;
        }
        &-menu{
            list-style: none;
            padding:0;
            margin:0;
            position: relative;
            &:after{
                content:'';
                display: block;
                height:100%;
                width:1px;
                background-color: rgba(140, 140, 140, 0.15);
                position:absolute;
                top:0;
                left:100%;
                pointer-events: none;
            }
            &>li{
                &>a{
                    display: block;
                    padding:10px 15px;
                    font-family: @font-gabriela;
                    font-size:20px;
                    color:black;
                    &.router-link-exact-active{
                        color:@color-pink;
                    }
                    &:hover{
                        color:@color-pink;
                    }
                }
                &.deep{
                    &:hover{
                        .cat-deep{
                            display: block;
                        }
                    }
                }
            }
        }
        &-deep{
            display: none;
            position: absolute;
            top:0;
            left:~'calc(100% - 0px)';
            height: 100%;
            list-style:none;
            padding:0;
            margin:7px 0 0 0;
            &>li{
                &>a{
                    color:black;
                    font-size:16px;
                    font-family: @font-gabriela;
                    padding:5px 25px;
                    &.router-link-active{
                        color:@color-pink;
                    }
                    &:hover{
                        color:@color-pink;
                    }
                }
            }

        }
    }
    .image{
        width:50%;
        background-repeat:no-repeat;
        background-size:cover;
        margin-top:15px;
    }
</style>