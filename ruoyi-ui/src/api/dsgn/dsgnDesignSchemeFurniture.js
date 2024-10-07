import request from '@/utils/request'

// 查询家具素材-设计方案关联列表
export function listDsgnDesignSchemeFurniture(query) {
  return request({
    url: '/dsgn/dsgnDesignSchemeFurniture/list',
    method: 'get',
    params: query
  })
}

// 查询家具素材-设计方案关联详细
export function getDsgnDesignSchemeFurniture(id) {
  return request({
    url: '/dsgn/dsgnDesignSchemeFurniture/' + id,
    method: 'get'
  })
}

// 新增家具素材-设计方案关联
export function addDsgnDesignSchemeFurniture(data) {
  return request({
    url: '/dsgn/dsgnDesignSchemeFurniture',
    method: 'post',
    data: data
  })
}

// 修改家具素材-设计方案关联
export function updateDsgnDesignSchemeFurniture(data) {
  return request({
    url: '/dsgn/dsgnDesignSchemeFurniture',
    method: 'put',
    data: data
  })
}

// 删除家具素材-设计方案关联
export function delDsgnDesignSchemeFurniture(id) {
  return request({
    url: '/dsgn/dsgnDesignSchemeFurniture/' + id,
    method: 'delete'
  })
}
