import request from '@/utils/request'

// 查询设计方案-色彩关联列表
export function listDsgnDesignSchemeColors(query) {
  return request({
    url: '/dsgn/dsgnDesignSchemeColors/list',
    method: 'get',
    params: query
  })
}

// 查询设计方案-色彩关联详细
export function getDsgnDesignSchemeColors(id) {
  return request({
    url: '/dsgn/dsgnDesignSchemeColors/' + id,
    method: 'get'
  })
}

// 新增设计方案-色彩关联
export function addDsgnDesignSchemeColors(data) {
  return request({
    url: '/dsgn/dsgnDesignSchemeColors',
    method: 'post',
    data: data
  })
}

// 修改设计方案-色彩关联
export function updateDsgnDesignSchemeColors(data) {
  return request({
    url: '/dsgn/dsgnDesignSchemeColors',
    method: 'put',
    data: data
  })
}

// 删除设计方案-色彩关联
export function delDsgnDesignSchemeColors(id) {
  return request({
    url: '/dsgn/dsgnDesignSchemeColors/' + id,
    method: 'delete'
  })
}
