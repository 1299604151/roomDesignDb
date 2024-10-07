import request from '@/utils/request'

// 查询设计方案列表
export function listDsgnDesignSchemes(query) {
  return request({
    url: '/dsgn/dsgnDesignSchemes/list',
    method: 'get',
    params: query
  })
}

// 查询设计方案详细
export function getDsgnDesignSchemes(id) {
  return request({
    url: '/dsgn/dsgnDesignSchemes/' + id,
    method: 'get'
  })
}

// 新增设计方案
export function addDsgnDesignSchemes(data) {
  return request({
    url: '/dsgn/dsgnDesignSchemes',
    method: 'post',
    data: data
  })
}

// 修改设计方案
export function updateDsgnDesignSchemes(data) {
  return request({
    url: '/dsgn/dsgnDesignSchemes',
    method: 'put',
    data: data
  })
}

// 删除设计方案
export function delDsgnDesignSchemes(id) {
  return request({
    url: '/dsgn/dsgnDesignSchemes/' + id,
    method: 'delete'
  })
}
