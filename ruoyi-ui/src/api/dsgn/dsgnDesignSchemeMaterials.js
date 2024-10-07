import request from '@/utils/request'

// 查询设计方案-材料关联列表
export function listDsgnDesignSchemeMaterials(query) {
  return request({
    url: '/dsgn/dsgnDesignSchemeMaterials/list',
    method: 'get',
    params: query
  })
}

// 查询设计方案-材料关联详细
export function getDsgnDesignSchemeMaterials(id) {
  return request({
    url: '/dsgn/dsgnDesignSchemeMaterials/' + id,
    method: 'get'
  })
}

// 新增设计方案-材料关联
export function addDsgnDesignSchemeMaterials(data) {
  return request({
    url: '/dsgn/dsgnDesignSchemeMaterials',
    method: 'post',
    data: data
  })
}

// 修改设计方案-材料关联
export function updateDsgnDesignSchemeMaterials(data) {
  return request({
    url: '/dsgn/dsgnDesignSchemeMaterials',
    method: 'put',
    data: data
  })
}

// 删除设计方案-材料关联
export function delDsgnDesignSchemeMaterials(id) {
  return request({
    url: '/dsgn/dsgnDesignSchemeMaterials/' + id,
    method: 'delete'
  })
}
