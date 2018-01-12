<template>
    <header class="header">
        <header-logo></header-logo>
        <div class="header-right">
            <header-favorit></header-favorit>
            <header-menu ref="header_menu"></header-menu>
        </div>
    </header>
</template>
<script>
    import HeaderLogo from './../Elements/HeaderLogo';
    import HeaderFavorit from './../Elements/HeaderFavorit';
    import HeaderMenu from './../Elements/HeaderMenu';
    export default {
        components:{
            HeaderLogo,HeaderFavorit,HeaderMenu
        }
    }
</script>
<style scoped lang="less">
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";
    .header{
        .flex(row,nowrap,space-between,center);
        &-right{
            .flex(row,nowrap,space-between,center);
        }
    }
</style>