<template>
    <div>
        <router-link to="/" class="logo">
            <img src="/images/logo.png" alt="">
            <span>CuDrag.md</span>
        </router-link>
    </div>
</template>
<script>
    export default {

    }
</script>
<style scoped lang="less">
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";
    span{
        font-family: @font-gabriela;
        font-size:35px;
        color:black;
        line-height:1;
        margin-left:25px;
    }
    .logo{
        .flex(row,nowrap,flex-start,center);
    }
</style>